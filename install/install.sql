BANS("CREATE TABLE IF NOT EXISTS tbl_banned_players("
				+ "banid 			CHAR(10)		PRIMARY KEY,"
				+ "uuid 			CHAR(36) 		NOT NULL,"
				+ "bannedFrom		CHAR(64)		NOT NULL,"
				+ "name 			VARCHAR(16) 	NOT NULL,"
				+ "reason			VARCHAR(255)	NOT NULL,"
				+ "banStart			BIGINT			UNSIGNED NOT NULL,"
				+ "banEnd			BIGINT			NOT NULL,"
				+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
				+ ")");
BAN_HISTORY("CREATE TABLE IF NOT EXISTS tbl_ban_history("
		+ "banid 			CHAR(10)		PRIMARY KEY,"
		+ "uuid 			CHAR(64) 		NOT NULL,"
		+ "bannedFrom		CHAR(64)		NOT NULL,"
		+ "name 			VARCHAR(32) 	NOT NULL,"
		+ "reason			VARCHAR(255)	NOT NULL,"
		+ "banStart			BIGINT			UNSIGNED NOT NULL,"
		+ "banEnd			BIGINT			NOT NULL,"
		+ "tempID			INT				UNSIGNED default(1) NOT NULL,"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
BAN_INFOS("CREATE TABLE IF NOT EXISTS tbl_ban_infos("
		+ "banid 			CHAR(10)		PRIMARY KEY,"
		+ "uuid 			CHAR(64) 		NOT NULL,"
		+ "name 			VARCHAR(32) 	NOT NULL,"
		+ "proof			TEXT 			NOT NULL default('-'),"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
BAN_TEMPLATES("CREATE TABLE IF NOT EXISTS tbl_ban_templates("
		+ "useless_id		INT				PRIMARY KEY AUTO_INCREMENT,"
		+ "id	 			INT				NOT NULL,"
		+ "times 			INT		 		NOT NULL,"
		+ "duration 		BIGINT		 	NOT NULL,"
		+ "reason			VARCHAR(255) 	NOT NULL default('-'),"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
MUTE_LIST("CREATE TABLE IF NOT EXISTS tbl_muted_players("
		+ "muteid 			CHAR(10)		PRIMARY KEY,"
		+ "uuid 			CHAR(64) 		NOT NULL,"
		+ "mutedFrom		CHAR(64)		NOT NULL,"
		+ "name 			VARCHAR(32) 	NOT NULL,"
		+ "reason			VARCHAR(255)	NOT NULL,"
		+ "muteStart		BIGINT			UNSIGNED NOT NULL,"
		+ "muteEnd			BIGINT			NOT NULL,"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
MUTE_INFOS("CREATE TABLE IF NOT EXISTS tbl_mute_infos("
		+ "muteid 			CHAR(10)		PRIMARY KEY,"
		+ "uuid 			CHAR(64) 		NOT NULL,"
		+ "name 			VARCHAR(32) 	NOT NULL,"
		+ "proof			TEXT 			NOT NULL default('-'),"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
MUTE_HISTORY("CREATE TABLE IF NOT EXISTS tbl_mute_history("
		+ "muteid 			CHAR(10)		PRIMARY KEY,"
		+ "uuid 			CHAR(64) 		NOT NULL,"
		+ "mutedFrom		CHAR(64)		NOT NULL,"
		+ "name 			VARCHAR(32) 	NOT NULL,"
		+ "reason			VARCHAR(255)	NOT NULL,"
		+ "muteStart		BIGINT			UNSIGNED NOT NULL,"
		+ "muteEnd			BIGINT			NOT NULL,"
		+ "tempID			INT				UNSIGNED default(1) NOT NULL,"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
MUTE_TEMPLATES("CREATE TABLE IF NOT EXISTS tbl_mute_templates("
		+ "useless_id		INT				PRIMARY KEY AUTO_INCREMENT,"
		+ "id	 			INT				NOT NULL,"
		+ "times 			INT		 		NOT NULL,"
		+ "duration 		BIGINT		 	NOT NULL,"
		+ "reason			VARCHAR(255) 	NOT NULL default('-'),"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");
KICK_TEMPLATES("CREATE TABLE IF NOT EXISTS tbl_kick_templates("
		+ "useless_id		INT				PRIMARY KEY AUTO_INCREMENT,"
		+ "id	 			INT				NOT NULL,"
		+ "reason			VARCHAR(255) 	NOT NULL default('-'),"
		+ "createdAt 		timestamp 		default(current_timestamp()) NOT NULL"
		+ ")");