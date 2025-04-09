import express from 'express';
import cors from 'cors';
import alunoRoutes from './routes/aluno.routes.js';
import dotenv from 'dotenv';
import videoaulasRoutes from './routes/videoaulas.js';
import questoesRoutes from './routes/questoes.js';


dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());
app.use('/questoes', questoesRoutes);

app.use(alunoRoutes); // rotas de login
app.use(videoaulasRoutes); // rotas que já incluem /videoaulas

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
