import java.rmi.Naming;

public class CalculadoraServer
{
  CalculadoraServer()
  {
    try {
      System.setProperty("java.rmi.server.hostname", "192.168.0.131");
      java.rmi.registry.LocateRegistry.createRegistry(1099);
      
      Calculadora c = new CalculadoraImple();
      Naming.bind("CalculadoraService", c);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  public static void main(String[] args) {
    new CalculadoraServer();
  }
}
