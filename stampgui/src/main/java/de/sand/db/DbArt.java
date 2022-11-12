package de.sand.db;



/**
 * Die "unterstützten" Datenbanktypen.
 *
 * @author lepper
 * @version 0.06 090114 jTDS vorbereitet<br>
 * 0.05 080822 nouser wieder rausgeworfen<br>
 * 0.04 080814 getSorteFromString<br>
 * 0.03 080707 Umstieg auf neuen mssql-jdbc-Treiber. Ärger. nouser testweise<br>
 * 0.02 071028 Ausweitungsversuche gen Oracle und ODBC, getSorteFromInt<br>
 * 0.01 070713
 */
enum DbArt {
	ACCESS2000 (0),
	MSSQL (1, "com.microsoft.sqlserver.jdbc.SQLServerDriver", "sqlserver" ),
	ORACLE (3, "oracle.jdbc.driver.OracleDriver", "oracle:thin" ),
	MYSQL (4, "com.mysql.jdbc.Driver", "mysql"),
	H2 (7, "org.h2.Driver", "h2");

  private int num;
	private String klasse, typ;
	private boolean nouser; // kein pwd, kein user

	DbArt(final int i) {
		num = i;
	}

	DbArt(final int i, final String kl, final String ty, final boolean nouser) {
		this(i);
		this.klasse = kl;
		this.typ = ty;
		this.nouser = nouser;
	}

	DbArt(final int i, final String kl, final String ty) {
		this(i, kl, ty, false);
	}

	 int getNum() {
		return num;
	}

	String getKlasse() {
		return klasse;
	}

	String getTyp() {
		return typ;
	}

	public boolean isNouser() {
		return nouser;
	}

	/**
	 * Liefert DbSorte zur int
	 *
	 * @param dbtyp
	 * @return
	 */
	public static DbArt getSorteFromInt(final int dbtyp) {
		for (final DbArt dbs : values() ) {
			if (dbs.getNum() == dbtyp) return dbs;
		}
		return null;
	}

	public static DbArt getSorteFromString(final String dbtyp) {
		for (final DbArt dbs : values() ) {
			if (dbs.name().equalsIgnoreCase(dbtyp)) return dbs;
		}
		return null;
	}

}
