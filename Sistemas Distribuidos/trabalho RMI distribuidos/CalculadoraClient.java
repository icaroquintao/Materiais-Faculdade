import java.rmi.Naming;

public class CalculadoraClient {
  public CalculadoraClient() {}
  
  public static void main(String[] args) { try { Calculadora c = (Calculadora)Naming.lookup("rmi://192.168.0.131:1099/CalculadoraService");
      
      System.out.println("Adição: " + c.add(10L, 15L));
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}
