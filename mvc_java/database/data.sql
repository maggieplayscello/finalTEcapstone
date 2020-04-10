-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user (user_name, password, salt, role) VALUES
('admin', 'z8jlLpoN3KTag0ADkVzrgg==', 'pxkD42rwvRwDOGUPmUeqS06X2+7rPfVXSNpkGyW204tGWOqDPxIIB27wvaNkE8wmrWYHFJh6bPq5CPP4kfmOiQ8FRiTGL1lFbVLx5DdWoBCjWoLjiB7Q3HOzrE/vxxui2QvagnapTVhLgg/0JPVmhSzA+2uhwLiVjesWfYV3Pdw=', 'Admin'); 

INSERT INTO courses (name, rating, slope, par, address, city, state, zip) VALUES

    ('Alpena Golf Club','70.9','127','72','1135 Golf Course Rd','Alpena','MI','49707'),
    ('Arcardia Bluffs Golf Course','75.7','146','72','14710 Northwood Hwy','Arcadia','MI','49613'),
    ('Bahle Farms Golf Course','72.4','137','71','9505 E Otto Rd','Suttons Bay','MI','49682'),
    ('Battle Creek Country Club','73.5','130','72','318 Country Club Dr','Battle Creek','MI','49015'),
    ('Belvedere Golf Club','73.6','131','72','5731 Marion Center Rd','Charlevoix','MI','49720'),
    ('Birmingham Country Club','73.3','138','72','1750 Saxon Dr','Birmingham','MI','48009'),
    ('Bucks Run Golf Club','73.5','146','72','1559 Chippewa','Mt Pleasant','MI','48858'),
    ('Cascade Hills Country Club','73.4','138','71','3725 Cascade Rd SE','Grand Rapids','MI','49546'),
    ('Chandler Park Golf Course','68.2','120','71','12801 Chandler Park Dr','Detroit','MI','48213'),
    ('Clearbrook Golf Course','73','135','71','6494 Clearbrook Dr','Saugatuck','MI','49453'),
    ('College Fields','72.3','133','71','3800 Hagadorn Rd','Okemos','MI','48864'),
    ('Cracklewood Golf Club','70.5','124','72','18215 24 Mile Rd','Macomb','MI','48042'),
    ('Crooked Tree Golf Club','72.8','139','71','600 Crooked Tree Dr','Petoskey','MI','49770'),
    ('Duck Lake Country Club','70','129','70','2728 Country Club Way','Albion','MI','49224'),
    ('Escanaba Country Club','70.8','127','72','1800 11th Ave S','Escanaba','MI','49829'),
    ('Firefly Golf Links','69.1','129','69','7795 S Clare Ave','Clare','MI','48617'),
    ('Fortress','74.2','142','72','950 Flint St','Frankenmuth','MI','48734'),
    ('Grandview Gold Club','71.5','134','72','3003 Hagni Rd NE','Kalkaska','MI','49646'),
    ('Hawkshead','74.1','135','72','523 Hawks Nest Dr','South Haven','MI','49090'),
    ('Inkster Valley Golf Club','72.5','130','72','2150 Middlebelt Rd','Inkster','MI','48141'),
    ('Lac Vieux Desert Golf Club','71.3','131','72','N5384 US-45','Watersmeet','MI','49969'),
    ('Mackinaw Club','71.8','126','72','11891 Mackinaw Hwy','Carp Lake','MI','49718'),
    ('Muskegon Country Club','73','139','72','2801 Lakeshore Dr','Muskegon','MI','49441'),
    ('Owosso Country Club','71','126','71','4200 N Chipman St','Owosso','MI','48867'),
    ('Pine River Country Club','72.3','132','71','1400 W Superior St','Alma','MI','48801'),
    ('Port Huron Golf Club','71.2','133','72','4101 Fairway Dr','Fort Gratiot','MI','48059'),
    ('Saginaw Golf Club','69.5','125','71','4465 Gratiot Rd','Saginaw','MI','48638'),
    ('Shenandoah Country Club','72','131','72','5600 Walnut Lake Rd','West Bloomfield','MI','48323'),
    ('Spring Lake Country Club','72.7','134','72','17496 N Fruitport Rd','Spring Lake','MI','49456'),
    ('Sylvan Glen Golf Club','72.7','123','70','5725 Rochester Rd','Troy','MI','48085'),
    ('Taylor Meadows Golf Club','69.6','126','72','25360 Ecorse Rd','Taylor','MI','48180'),
    ('Timber Ridge Golf Club','72.9','144','72','16339 Park Lake Rd','East Lansing','MI','48823'),
    ('Verona Hills Golf Club','73.3','136','71','7840, 3175 Sand Beach Rd','Bad Axe','MI','48413'),
    ('Wawashkamo Golf Club','68.6','121','70','1 British Landing Rd','Mackinac Island','MI', '49757'),
    ('Whispering Pines Golf Course','71.6','137','69','2500 Whispering Pines Dr','Pinckney','MI','48169'),
    ('White Pine National Golf Resort','73.1','132','72','3450 N Hubbard Lake Rd','Spruce','MI','48762'),
    ('Cherry Creek Golf Club','73.3','142','72','52000 Cherry Creek Dr','Shelby Twp','MI','48316'),
    ('Black Bear Golf Club','71.8','144','72','1500 E Alexander Rd','Vanderbilt','MI','49795'),
    ('Cadillac Country Club','69.3','130','70','5510 M-55','Cadillac','MI','49601'),
    ('Carleton Glen Golf Club','71.9','127','71','13470 Grafton Rd','Carleton','MI','48117');

COMMIT;