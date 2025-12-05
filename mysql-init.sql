USE wordpress;

-- Create user with weak password
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, display_name) 
VALUES ('admin', MD5('admin'), 'admin', 'admin@vulnerable.local', NOW(), 'Administrator');

INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, display_name) 
VALUES ('johndoe', MD5('password'), 'John Doe', 'john@vulnerable.local', NOW(), 'John Doe');

-- Grant admin privileges
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (1, 'wp_user_level', '10');

-- Add personal data for testing data exfiltration
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (2, 'first_name', 'John');
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (2, 'last_name', 'Doe');
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (2, 'ssn', '123-45-6789');
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (2, 'credit_card', '4111-1111-1111-1111');

-- Sample blog posts
INSERT INTO wp_posts (post_author, post_date, post_content, post_title, post_status, post_type) 
VALUES (2, NOW(), 'This is my first blog post with sensitive company information...', 'Welcome to My Blog', 'publish', 'post');

INSERT INTO wp_posts (post_author, post_date, post_content, post_title, post_status, post_type) 
VALUES (2, NOW(), 'Private notes: API keys and passwords stored here', 'Security Notes', 'private', 'post');

