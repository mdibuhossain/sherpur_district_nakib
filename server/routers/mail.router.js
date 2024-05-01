import express from 'express';
import { mailController } from '../controllers/mail.controller.js';

const mailRouter = express.Router();

mailRouter.get('/', mailController.getMails);
mailRouter.get('/:id', mailController.getMail);
mailRouter.post('/', mailController.sendMail);
mailRouter.delete('/:id', mailController.deleteMail);

export default mailRouter;