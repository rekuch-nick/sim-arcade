declareENums();


blankMap(); // fMap[], zMap[] declared inside




//player setup
actions = ds_list_create();
action = 0;

ds_list_add(actions, acts.zoneR);
ds_list_add(actions, acts.zoneA);
ds_list_add(actions, acts.zoneC);
ds_list_add(actions, acts.dezone);
ds_list_add(actions, acts.wait);

xDown = -1;
yDown = -1;

growLuck = 0;

cash = 100;
food = 100;
people = 0;
jobs = 0;
month = 1;

depth = -1100;