import pool from '../db/index.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

export const login = async (req, res) => {
  const { email, senha } = req.body;
  try {
    const result = await pool.query('SELECT * FROM alunos WHERE email = $1', [email]);
    if (result.rows.length === 0) return res.status(401).json({ mensagem: 'Usuário não encontrado' });

    const aluno = result.rows[0];
    const senhaCorreta = senha === aluno.senha; // usar bcrypt se estiver usando senhas criptografadas
    if (!senhaCorreta) return res.status(401).json({ mensagem: 'Senha incorreta' });

    const token = jwt.sign({ id: aluno.id_aluno }, process.env.JWT_SECRET, { expiresIn: '1h' });
    res.json({ token, aluno: { id: aluno.id_aluno, nome: aluno.nome } });
  } catch (err) {
    res.status(500).json({ erro: err.message });
  }
};

export const getVideoaulas = async (req, res) => {
  const alunoID = req.userId;
  try {
    const resultado = await pool.query(`
      SELECT v.dimensao, v.videoaula AS link
      FROM desempenho d
      JOIN videoaulas v ON d.dimensao = v.dimensao
      WHERE d.id_aluno = $1 AND d.parametro = 'Não proficiente'
    `, [alunoID]);
    res.json(resultado.rows);
  } catch (err) {
    res.status(500).json({ erro: err.message });
  }
};

export const getQuestoes = async (req, res) => {
  const { dimensao } = req.params;
  try {
    const resultado = await pool.query('SELECT * FROM questoes WHERE dimensao = $1', [dimensao]);
    res.json(resultado.rows);
  } catch (err) {
    res.status(500).json({ erro: err.message });
  }
};

export const salvarResultado = async (req, res) => {
  const alunoID = req.userId;
  const { dimensao, acertos } = req.body;
  try {
    const parametro = acertos >= 2 ? 'Proficiente' : 'Não proficiente';
    await pool.query(`
      UPDATE desempenho
      SET resultado = $1, parametro = $2
      WHERE id_aluno = $3 AND dimensao = $4
    `, [`${acertos * 50}%`, parametro, alunoID, dimensao]);

    res.json({ mensagem: 'Resultado salvo com sucesso.' });
  } catch (err) {
    res.status(500).json({ erro: err.message });
  }
};
