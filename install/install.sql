
CREATE TABLE IF NOT EXISTS tbl_templates (
    template_id CHAR(6) PRIMARY KEY,
    id INT NOT NULL,
    times INT NOT NULL,
    duration_seconds BIGINT NOT NULL,
    reason VARCHAR(255) NOT NULL DEFAULT '-',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    mute BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS tbl_penaltys (
    ban_id CHAR(6) PRIMARY KEY,
    uuid CHAR(36) NOT NULL,
    bannedFrom CHAR(36) NOT NULL,
    name VARCHAR(16) NOT NULL,
    reason VARCHAR(255),
    banStart TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(),
    banEnd TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(),
    createdAt TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    template CHAR(6),
    mute BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (template) REFERENCES tbl_templates(template_id)
);

CREATE TABLE IF NOT EXISTS tbl_reports (
    reportid CHAR(6) PRIMARY KEY,
    uuid CHAR(36) NOT NULL,
    reportedFrom CHAR(36) NOT NULL,
    name VARCHAR(16) NOT NULL,
    reason VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    template CHAR(6),
    FOREIGN KEY (template) REFERENCES tbl_templates(template_id)
);

CREATE TABLE IF NOT EXISTS meta(
    version VARCHAR(32) NOT NULL PRIMARY KEY,
    installedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL
);

#INSERT INTO meta (version) VALUES ('0.0.11');

