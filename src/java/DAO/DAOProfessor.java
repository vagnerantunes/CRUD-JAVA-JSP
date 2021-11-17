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
    
    //inserir professor
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
    
    //metodo listar todos professores
    public ArrayList<Professor> listarProfessores(){
        String sql = "SELECT * FROM tb_professor";
        
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()){
                Professor professor = new Professor();
                professor.setId(rs.getInt("id_professor"));
                professor.setNome(rs.getString("nome_professor"));
                professor.setEmail(rs.getString("email_professor"));
                professor.setSenha(rs.getString("senha_professor"));
                lista.add(professor);
            }
            
        } catch (Exception erro) {
            throw new RuntimeException("Erro no metodo listar todos professores" + erro);
        }
        return lista;
    }
    
    //metodo buscar professor por nome
    public ArrayList<Professor> listarProfessorNome(String valor){
        String sql = "SELECT * FROM tb_professor WHERE nome_professor LIKE '%" + valor + "%' ";
        
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while (rs.next()) {                
                Professor professor = new Professor();
                professor.setId(rs.getInt("id_professor"));
                professor.setNome(rs.getString("nome_professor"));
                professor.setEmail(rs.getString("email_professor"));
                professor.setSenha(rs.getString("senha_professor"));
                lista.add(professor);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro no metodo listar professor por nome" + erro);
        }
        return lista;
    }
    
    //metodo atualizar professor
    public void atualizarProfessor(Professor professor){
        try {
            String sql = "UPDATE tb_professor SET nome_professor = ?, email_professor = ?, senha_professor = ? "
                    + "WHERE id_professor = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, professor.getNome());
            stmt.setString(2, professor.getEmail());
            stmt.setString(3, professor.getSenha());
            stmt.setInt(4, professor.getId());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro metodo atualizar professor");
        }
    }
    
    //metodo excluir professor
    public void excluirProfessor(int valor){
        try {
            String sql = "DELETE ROM tb_professor WHERE id_professor = " + valor;
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro metodo excluir professor" + erro);
        }
    }
}
