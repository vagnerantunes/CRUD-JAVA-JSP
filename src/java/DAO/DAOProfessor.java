package DAO;

import MODEL.Professor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAOProfessor {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Professor> lista = new ArrayList<>();
    
    public DAOProfessor(){
        conn = new Conexao().getConexao();
    }
    
    public void inserirProfessor(Professor professor){
        String sql = "INSERT INTO tb_professor (nome_professor,email_professor,senha_professor) VALUES (?,?,?)";
                
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, professor.getNome());
            stmt.setString(2, professor.getEmail());
            stmt.setString(3, professor.getSenha());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro ao inserir professor" + erro);
        }
    }
}
