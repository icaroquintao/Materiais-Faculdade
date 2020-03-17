import java.rmi.Remote;
import java.rmi.RemoteException;

public abstract interface Calculadora
  extends Remote
{
  public abstract long add(long paramLong1, long paramLong2)
    throws RemoteException;
}
