-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO "app_user" (user_name, password, role, salt) VALUES 
('admin', 'W2VKJp0IXMMBdQJIvbBY3Q==', 'Admin', 'JyiicUsnVQGiuDWM85vwtDo85vCgdWcAcy3TYYQmYL8XMOH8FDqzUmgi01Ou2I3xJ3ZoR+1nJNOJVMytvNOWHvBTaQNhb8xCIcPzqU/BjSuGYeVFgfSwSUirecnXj7eDs7D4SArwQcu7FXo3TyutdS25IxmnYMg17CPnheLygqs=');

INSERT INTO "courses" (name, rating, slope, par, city, state) VALUES
('Alpena Golf Club',70.9,127.0,72.0,'Alpena','MI'),
('Arcardia Bluffs Golf Course',75.7,146.0,72.0,'Arcadia','MI'),
('Bahle Farms Golf Course',72.4,137.0,71.0,'Suttons Bay','MI'),
('Battle Creek Country Club',73.5,130.0,72.0,'Battle Creek','MI'),
('Belvedere Golf Club',73.6,131.0,72.0,'Charlevoix','MI'),
('Birmingham Country Club',73.3,138.0,72.0,'Birmingham','MI'),
('Bucks Run Golf Club',73.5,146.0,72.0,'Mt Pleasant','MI'),
('Cascade Hills Country Club',73.4,138.0,71.0,'Grand Rapids','MI'),
('Chandler Park Golf Course',68.2,120.0,71.0,'Detroit','MI'),
('Clearbrook Golf Course',73.0,135.0,71.0,'Saugatuck','MI'),
('College Fields',72.3,133.0,71.0,'Okemos','MI'),
('Cracklewood Golf Club',70.5,124.0,72.0,'Macomb','MI'),
('Crooked Tree Golf Club',72.8,139.0,71.0,'Petoskey','MI'),
('Duck Lake Country Club',70.0,129.0,70.0,'Albion','MI'),
('Escanaba Country Club',70.8,127.0,72.0,'Escanaba','MI'),
('Firefly Golf Links',69.1,129.0,69.0,'Clare','MI'),
('Fortress',74.2,142.0,72.0,'Frankenmuth','MI'),
('Grandview Gold Club',71.5,134.0,72.0,'Kalkaska','MI'),
('Hawkshead',74.1,135.0,72.0,'South Haven','MI'),
('Inkster Valley Golf Club',72.5,130.0,72.0,'Inkster','MI'),
('Lac Vieux Desert Golf Club',71.3,131.0,72.0,'Watersmeet','MI'),
('Mackinaw Club',71.8,126.0,72.0,'Mackinaw City','MI'),
('Muskegon Country Club',73.0,139.0,72.0,'Muskegon','MI'),
('Owosso Country Club',71.0,126.0,71.0,'Owosso','MI'),
('Pine River Country Club',72.3,132.0,71.0,'Alma','MI'),
('Port Huron Golf Club',71.2,133.0,72.0,'Fort Gratiot','MI'),
('Saginaw Golf Club',69.5,125.0,71.0,'Saginaw','MI'),
('Shenandoah Country Club',72.0,131.0,72.0,'West Bloomfield','MI'),
('Spring Lake Country Club',72.7,134.0,72.0,'Spring Lake','MI'),
('Sylvan Glen Golf Club',72.7,123.0,70.0,'Troy','MI'),
('Taylor Meadows Golf Club',69.6,126.0,72.0,'Taylor','MI'),
('Timber Ridge Golf Club',72.9,144.0,72.0,'East Lansing','MI'),
('Verona Hills Golf Club',73.3,136.0,71.0,'Bad Axe','MI'),
('Wawashkamo Golf Club',68.6,121.0,70.0,'Mackinac Island','MI'),
('Whispering Pines Golf Course',71.6,137.0,69.0,'Pinckney','MI'),
('White Pine National Golf Resort',73.1,132.0,72.0,'Spruce','MI'),
('Cherry Creek Golf Club',73.3,142.0,72.0,'Shelby Twp','MI'),
('Black Bear Golf Club',71.8,144.0,72.0,'Vanderbilt','MI'),
('Cadillac Country Club',69.3,130.0,70.0,'Cadillac','MI'),
('Carleton Glen Golf Club',71.9,127.0,71.0,'Carleton','MI');

COMMIT;