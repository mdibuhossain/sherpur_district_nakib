import prisma from "../db/db.config.js";

export class mailController {
    static async getMails(req, res) {
        try {
            const mails = await prisma.mail.findMany();
            res.status(200).json(mails);
        } catch (error) {
            res.status(500).json({ error });
        }
    }
    static async getMail(req, res) {
        try {
            const { id } = req.params;
            const mail = await prisma.mail.findUnique({
                where: {
                    id: parseInt(id),
                },
            });
            res.status(200).json(mail);
        } catch (error) {
            res.status(500).json({ error });
        }
    }
    static async sendMail(req, res) {
        try {
            const payload = req.body;
            console.log(payload)
            const mail = await prisma.mail.create({
                data: {
                    name: payload.name,
                    email: payload.email,
                    subject: payload.subject,
                    message: payload.message,
                },
            });
            res.status(201).json({ message: "Mail send successfully" });
        } catch (error) {
            res.status(500).json({ error });
        }
    }
    static async deleteMail(req, res) {
        try {
            const { id } = req.params;
            await prisma.mail.delete({
                where: {
                    id: parseInt(id),
                },
            });
            res.status(200).json({ message: "Mail deleted successfully" });
        } catch (error) {
            res.status(500).json({ error });
        }
    }
}