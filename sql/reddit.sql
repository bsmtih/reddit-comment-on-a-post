CREATE TABLE profile (
	profileId INT UNSIGNED AUTO_INCREMENT NOT NULL,
	profileDateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	profileEmail VARCHAR (128) NOT NULL,
	profileUserDob DATE,
	UNIQUE (profileEmail),
	UNIQUE (profileId),
	PRIMARY KEY (profileId)
);
CREATE TABLE post (
	postId INT UNSIGNED NOT NULL,
	postProfileId INT UNSIGNED NOT NULL,
	postContent VARCHAR(255),
	postDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	UNIQUE (postId),
	UNIQUE (postProfileId),
	PRIMARY KEY (postId),
	FOREIGN KEY (postProfileId) REFERENCES profile(profileId)
);
CREATE TABLE comment (
	commentPostId INT UNSIGNED NOT NULL,
	commentProfileId INT UNSIGNED NOT NULL,
	commentContent VARCHAR(255),
	commentDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	UNIQUE (commentPostId),
	UNIQUE (commentProfileId),
	FOREIGN KEY (commentPostId) REFERENCES post(postId),
	FOREIGN KEY (commentProfileId) REFERENCES profile(profileId)
);
CREATE TABLE postVote (
	postVoteVote TINYINT,
	postVoteProfileId INT UNSIGNED NOT NULL,
	postVotePostId INT UNSIGNED NOT NULL,
	FOREIGN KEY (postVoteProfileId) REFERENCES profile (profileId),
	FOREIGN KEY (postVotePostId) REFERENCES post (postId)
);
CREATE TABLE commentVote (
	commentVoteVote          TINYINT,
	commentVoteCommentPostId INT UNSIGNED NOT NULL,
	commentVoteProfileId     INT UNSIGNED NOT NULL,
	FOREIGN KEY (commentVoteCommentPostId) REFERENCES comment (commentPostId),
	FOREIGN KEY (commentVoteProfileId) REFERENCES profile (profileId)
);