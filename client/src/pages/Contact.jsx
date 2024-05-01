import axios from "axios";
import { Button, Spinner, Textarea, TextInput } from "flowbite-react";
import { useState } from "react";


const Contact = () => {
    const [loading, setLoading] = useState(false);

    const handleSubmit = (e) => {
        e.preventDefault();
        const formData = new FormData(e.target);
        const payload = {
            name: formData.get("name"),
            email: formData.get("email"),
            subject: formData.get("subject"),
            message: formData.get("message"),
        }
        try {
            setLoading(true);
            axios.post(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/mail`, payload)
                .then(res => {
                    setLoading(false);
                    alert("Successfully sent the message");
                    e.target.reset();
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
        <div>
            <div className="flex flex-col items-center justify-center mt-5">
                <div>
                    <h1 className="mb-8">Let us know your <span className="font-bold text-orange-400">thoughts</span></h1>
                    <form onSubmit={handleSubmit} className="flex max-w-md flex-col gap-4 mx-auto">
                        <TextInput type="text" name="name" placeholder="Your Name" required shadow />
                        <TextInput type="email" name="email" placeholder="Your Email" required shadow />
                        <TextInput type="text" name="subject" placeholder="Subject" required shadow />
                        <Textarea type="text" id="message" name="message" placeholder="You message..." required rows={4} />
                        <Button type="submit">{
                            loading ? <>
                                <Spinner aria-label="Spinner button example" size="sm" />
                                <span className="pl-3">Loading...</span>
                            </> : "Submit"}</Button>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Contact;