import axios from "axios";
import { Spinner } from "flowbite-react";
import { useEffect, useState } from "react";

const MailBox = () => {
    const [mails, setMails] = useState([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        try {
            setLoading(true);
            axios.get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/mail`)
                .then(res => {
                    setMails(res.data);
                })
                .catch(error => {
                    console.log(error);
                }).finally(() => {
                    setLoading(false);
                });
        } catch (error) {
            console.log(error);
        }
    }, []);

    const handleDeleteMail = (id) => {
        try {
            setLoading(true);
            axios.delete(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/mail/${id}`)
                .then(res => {
                    setMails(mails.filter(mail => mail.id !== id));
                })
                .catch(error => {
                    console.log(error);
                }).finally(() => {
                    setLoading(false);
                });
        } catch (error) {
            console.log(error);
        }
    }


    return (
        <>
            <h2 className="mb-6 text-center text-3xl font-bold text-gray-900">
                মেইলবক্স
            </h2>
            {loading ? <Spinner aria-label="Spinner button example" size="sm" /> :
                <div className="flex flex-col gap-4">
                    {mails.map((mail) => (
                        <div
                            key={mail.id}
                            className="flex flex-col p-4 bg-gray-100 rounded-md border-2 gap-1 shadow-md shadow-[#919191]"
                        >
                            <div className="flex justify-between text-gray-400">
                                <p className="text-gray-800">{mail.name} ({mail.email})</p>
                                <div className="flex gap-x-3">
                                    <p>{new Date(mail.createdAt).toLocaleString()}</p>
                                    <button className="text-red-600" onClick={() => handleDeleteMail(mail.id)}>
                                        <svg
                                            clipRule="evenodd"
                                            fillRule="evenodd"
                                            strokeLinejoin="round"
                                            strokeMiterlimit="2"
                                            viewBox="0 0 24 24"
                                            width="24"
                                            height="24"
                                            fill="currentColor"
                                            xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                d="m4.015 5.494h-.253c-.413 0-.747-.335-.747-.747s.334-.747.747-.747h5.253v-1c0-.535.474-1 1-1h4c.526 0 1 .465 1 1v1h5.254c.412 0 .746.335.746.747s-.334.747-.746.747h-.254v15.435c0 .591-.448 1.071-1 1.071-2.873 0-11.127 0-14 0-.552 0-1-.48-1-1.071zm14.5 0h-13v15.006h13zm-4.25 2.506c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm-4.5 0c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm3.75-4v-.5h-3v.5z"
                                                fillRule="nonzero"
                                            />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div>
                                Subject: <em>{mail.subject}</em>
                            </div>
                            <div className="bg-gray-200 p-2 px-3 rounded-md">
                                {mail.message}
                            </div>
                        </div>
                    ))}
                </div>
            }
        </>
    );
}

export default MailBox;