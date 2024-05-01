import axios from "axios";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const HospitalView = () => {
    const { id } = useParams();
    const [loading, setLoading] = useState(true);
    const [hospital, setHospital] = useState(null);

    useEffect(() => {
        const fetchHospital = async () => {
            setLoading(true);
            try {
                axios
                    .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/hospital/${id}`)
                    .then((res) => {
                        setHospital(res.data);
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                    .finally(() => setLoading(false));
            } catch (error) {
                console.log(error);
                setLoading(false);
            }
        };
        fetchHospital();
    }, [id]);


    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <div>
            <div className="space-y-2 mt-3">
                <h3 className="font-extrabold">{hospital?.name}</h3>
                <p><strong>মোট সিট: </strong>{hospital?.seats}</p>
                <p><strong>ঠিকানা: </strong>{hospital?.address}</p>
                <p><strong>যোগাযোগ: </strong>{hospital?.contact}</p>
                <p><strong>নিযুক্ত ডাক্তারগণ:</strong></p>
            </div>
            <ul className="space-y-3 flex flex-col">
                {hospital?.doctors.map((doctor) => (
                    <li key={doctor._id} className="bg-gray-200 p-3 rounded-md">
                        <div className="space-y-2">
                            <p><strong>নাম: </strong>{doctor.name}</p>
                            <p><strong>পদবী: </strong>{doctor.designation}</p>
                            <p><strong>যোগাযোগ: </strong>{doctor.contact}</p>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default HospitalView;