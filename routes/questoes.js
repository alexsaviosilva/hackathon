// routes/questoes.js
import express from 'express';
import pool from '../db/index.js';
import { verificarToken } from '../middleware/auth.middleware.js';

const router = express.Router();

router.get('/questoes/:dimensao', verificarToken, async (req, res) => {
  const { dimensao } = req.params;

  try {
    const { rows } = await pool.query(
      'SELECT * FROM questoes WHERE dimensao = $1',
      [dimensao]
    );
    res.json(rows);
  } catch (error) {
    console.error('Erro ao buscar questões:', error);
    res.status(500).json({ mensagem: 'Erro ao buscar questões.' });
  }
});

export default router;
