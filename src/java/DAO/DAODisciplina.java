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
    
    //metodo inserir disciplina
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
    
    //metodo listar todas disciplinas
    public ArrayList<Disciplina> listarDisciplinas(){
        String sql = "SELECT * FROM tb_disciplina";
        
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()){
                Disciplina disciplina = new Disciplina();
                disciplina.setId(rs.getInt("id_professor"));
                disciplina.setNome(rs.getString("nome_disciplina"));
                disciplina.setCargahoraria(rs.getInt("cargahoraria_disciplina"));
                
                lista.add(disciplina);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro no metodo listar todos professores" + erro);
        }
        return lista;
    }
    
    //metodo buscar disciplina por nome
    public ArrayList<Disciplina> listarDisciplinaNome(String valor){
        String sql = "SELECT * FROM tb_disciplina WHERE nome_disciplina LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while (rs.next()) {                
                Disciplina disciplina = new Disciplina();
                disciplina.setId(rs.getInt("id_disciplina"));
                disciplina.setNome(rs.getString("nome_disciplina"));
                disciplina.setCargahoraria(rs.getInt("cargahoraria_disciplina"));
                lista.add(disciplina);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro no metodo listar disciplina por nome" + erro);
        }
        return lista;
    }
    
    //metodo atualizar disciplina
    public void atualizarDisciplina(Disciplina disciplina){
        try {
            String sql = "UPDATE tb_disciplina SET nome_disciplina = ?, cargahoraria_disciplina = ? "
                    + "WHERE id_disciplina = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, disciplina.getNome());
            stmt.setInt(2, disciplina.getCargahoraria());
            stmt.setInt(3, disciplina.getId());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro metodo atualizar disciplina");
        }
    }
    
    //metodo excluir disciplina
    public void excluirDisciplina(int valor){
        try {
            String sql = "DELETE FROM tb_disciplina WHERE id_disciplina = " + valor;
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro metodo excluir disciplina: " + erro);
        }
    }
}
