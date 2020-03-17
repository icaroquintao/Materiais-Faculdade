import java.rmi.RemoteException;

public class CalculadoraImple extends java.rmi.server.UnicastRemoteObject implements Calculadora
{
  private static final long serialVersionUID = 1L;
  
  protected CalculadoraImple() throws RemoteException
  {}
  
  public long add(long a, long b) throws RemoteException
  {
    return a + b;
  }
}
