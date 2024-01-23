/*
 * Copyright information and "All Rights Reserved"
 */
package de.sand.utils;

/**
 * The Class WrongConfigException.
 *
 * @author Catalin Patruica
 */
public class WrongConfigException extends Exception {

  /**
     *
     */
  private static final long serialVersionUID = -5062465259671216775L;

  private String password;

  private String user;

  private int dbType;

  private String hostAndPort;

  /**
   * Instantiates a new wrong config exception.
   *
   * @param password the password
   * @param user the user
   * @param dbType the db type
   * @param hostAndPort the host and port
   */
  public WrongConfigException(String password, String user, int dbType, String hostAndPort) {
    this.user = user;
    this.password = password;
    this.dbType = dbType;
    this.hostAndPort = hostAndPort;
  }

  /**
   * Instantiates a new wrong config exception.
   *
   * @param message the message
   * @param password the password
   * @param user the user
   * @param dbType the db type
   * @param hostAndPort the host and port
   * @param jVparallel the j vparallel
   * @param uJparallel the u jparallel
   */
  public WrongConfigException(String message, String password, String user, int dbType,
      String hostAndPort) {
    super(message);
    this.password = password;
    this.user = user;
    this.dbType = dbType;
    this.hostAndPort = hostAndPort;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getHostAndPort() {
    return hostAndPort;
  }

  public void setHostAndPort(String hostAndPort) {
    this.hostAndPort = hostAndPort;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public int getDbType() {
    return dbType;
  }

  public void setDbType(int dbType) {
    this.dbType = dbType;
  }


}
