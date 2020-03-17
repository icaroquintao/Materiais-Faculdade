import java.lang.reflect.Method;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.UnexpectedException;
import java.rmi.server.RemoteObject;
import java.rmi.server.RemoteRef;
import java.rmi.server.RemoteStub;

public final class CalculadoraImple_Stub
  extends RemoteStub
  implements Calculadora, Remote
{
  private static final long serialVersionUID = 2L;
  private static Method $method_add_0;
  
  static
  {
    try
    {
      $method_add_0 = Calculadora.class.getMethod("add", new Class[] { Long.TYPE, Long.TYPE });
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new NoSuchMethodError("stub class initialization failed");
    }
  }
  
  public CalculadoraImple_Stub(RemoteRef paramRemoteRef)
  {
    super(paramRemoteRef);
  }
  
  public long add(long paramLong1, long paramLong2)
    throws RemoteException
  {
    try
    {
      Object localObject = ref.invoke(this, $method_add_0, new Object[] { new Long(paramLong1), new Long(paramLong2) }, 8040560279107955721L);
      return ((Long)localObject).longValue();
    }
    catch (RuntimeException localRuntimeException)
    {
      throw localRuntimeException;
    }
    catch (RemoteException localRemoteException)
    {
      throw localRemoteException;
    }
    catch (Exception localException)
    {
      throw new UnexpectedException("undeclared checked exception", localException);
    }
  }
}
