// routes/videoaulas.js
import express from 'express';
import pool from '../db/index.js';
import { verificarToken } from '../middleware/auth.middleware.js';

const router = express.Router();

router.get('/videoaulas', verificarToken, async (req, res) => {
  try {
    console.log('🧪 req.aluno:', req.aluno);

    const idAluno = req.aluno?.id;

    if (!idAluno) {
      console.error('❌ ID do aluno não encontrado no token');
      return res.status(401).json({ mensagem: 'ID do aluno não encontrado.' });
    }

    const { rows: resultados } = await pool.query(
      'SELECT dimensao FROM resultados WHERE id_aluno = $1 AND parametro = $2',
      [idAluno, 'Não proficiente']
    );

    console.log('📊 Dimensões não proficientes:', resultados);

    if (resultados.length === 0) {
      return res.status(200).json([]);
    }

    const dimensoes = resultados.map(r => r.dimensao);

    const { rows: aulas } = await pool.query(
      'SELECT * FROM videoaulas WHERE dimensao = ANY($1)',
      [dimensoes]
    );

    console.log('🎬 Aulas encontradas:', aulas);
    res.json(aulas);
  } catch (error) {
    console.error('❌ Erro ao buscar videoaulas:', error);
    res.status(500).json({ mensagem: 'Erro ao buscar videoaulas.' });
  }
});

export default router;
