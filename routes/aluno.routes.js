import express from 'express';
import db from '../db/index.js';
import jwt from 'jsonwebtoken';

const router = express.Router();

router.post('/login', async (req, res) => {
  const { email, senha } = req.body;

  if (!email || !senha) {
    return res.status(400).json({ erro: 'Email e senha são obrigatórios.' });
  }

  try {
    const result = await db.query(
      'SELECT * FROM alunos WHERE email = $1 AND senha = $2',
      [email, senha]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({ erro: 'Email ou senha inválidos.' });
    }

    const aluno = result.rows[0];
console.log('👤 Aluno encontrado no login:', aluno); // Adicione isso só pra teste

const token = jwt.sign({ id: aluno.id }, process.env.JWT_SECRET, {
  expiresIn: '1h',
});

    res.json({
      mensagem: 'Login bem-sucedido',
      token,
      aluno: {
        id: aluno.id_aluno,
        nome: aluno.nome,
        email: aluno.email
      }
    });
  } catch (erro) {
    console.error('Erro no login:', erro);
    res.status(500).json({ erro: 'Erro interno no servidor.' });
  }
});

export default router;
