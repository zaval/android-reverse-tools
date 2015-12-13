import javassist.*;
import java.util.logging.*;
import java.io.IOException;
 
public class Hook
{
    public void addHook(String targetClass, String targetMethod, String hookText)
        throws NotFoundException, CannotCompileException, IOException
    {
        Logger logger = Logger.getLogger("Javassist");
        final String targetFolder = "./modified/";

        try
        {
            final ClassPool pool = ClassPool.getDefault();
            pool.appendClassPath(new LoaderClassPath(getClass().getClassLoader()));
            pool.appendClassPath(".");
            final CtClass compiledClass = pool.get(targetClass);
            final CtClass[] arguments = {pool.get("java.lang.String"), pool.get("boolean")};
            final CtMethod method = compiledClass.getDeclaredMethod(targetMethod, arguments);
            
           // http://www.csg.ci.i.u-tokyo.ac.jp/~chiba/javassist/tutorial/tutorial2.html#before
            method.insertBefore(hookText);
            compiledClass.writeFile(targetFolder);

            logger.info(targetClass + "." + targetMethod + " has been modified and saved under " + targetFolder);
        }
        catch (NotFoundException e)
        {
            logger.warning("Failed to find the target class to modify " + targetClass + e);
        }
    }

    public static void main(String[] args)
        throws Exception
    {
        final String targetClass = ""; //target class
        final String targetMethod = ""; //target method
        final String hookText = ""; // hook code

        new Hook().addHook(targetClass, targetMethod, hookText);
    }
}
