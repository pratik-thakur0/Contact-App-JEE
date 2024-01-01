package app.contact.exception;

/**
 * Use this class to report authentication failed problem due to invalid loginId and password.
 * @author pratik
 */
public class InvalidCredentialException extends Exception{

    public InvalidCredentialException() {
    }

    public InvalidCredentialException(String errMsg) {
        super(errMsg);
    }
    
}
