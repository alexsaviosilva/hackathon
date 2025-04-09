// middleware/auth.middleware.js
import jwt from 'jsonwebtoken';

export function verificarToken(req, res, next) {
  const authHeader = req.headers['authorization'];

  if (!authHeader) {
    return res.status(401).json({ mensagem: 'Token não fornecido.' });
  }

  const token = authHeader.split(' ')[1]; // separa "Bearer token"

  if (!token) {
    return res.status(401).json({ mensagem: 'Token inválido.' });
  }

  jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
    if (err) {
      return res.status(403).json({ mensagem: 'Token inválido ou expirado.' });
    }

    // Adiciona o ID do aluno ao req
    req.aluno = { id: decoded.id }; // 🔥 aqui é o ponto-chave!
    next();
  });
}
