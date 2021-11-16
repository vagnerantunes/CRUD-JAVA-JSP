package DAO;

import MODEL.Disciplina;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAODisciplina {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Disciplina> lista = new ArrayList<>();
    
    public DAODisciplina(){
        conn = new Conexao().getConexao();
    }
    
    public void inserirDisciplina(Disciplina disciplina){
        String sql = "INSERT INTO tb_disciplina (nome_disciplina,cargahoraria_disciplina) VALUES (?,?)";
        
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, disciplina.getNome());
            stmt.setInt(2, disciplina.getCargahoraria());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro ao inserir disciplina", erro);
        }
    }
    
}
