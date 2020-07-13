text[0] = "By default, you can perform a basic attack with left click.";
text[1] = "Open your inventory again (With [Esc] by default), and click on the “Skills” button at the bottom to switch to the Skills menu.";
text[2] = "Just like items, you can hover your cursor over a skill to display its properties on the right side. You can also click on a skill to lock the display to that skill, Clicking outside of that skill will either switch the lock to a different skill, or unlock the display.";
text[3] = "In addition, you can use your cursor to drag and drop skills to and from your skill hotbar.";
text[4] = "Defeating enemies will grant you “Class Proficiency” for the class that you are playing. You can unlock class skills by spending Class Proficiency in the Skills menu.";
text[5] = "Here\’s some Class Proficiency to help you get started. Click the blue “Unlock” button when you have a skill selected to unlock the skill!"

speakers = array_create(9,id);
pretext = array_create(9,-1);
posttext = array_create(9,-1);

posttext[5] = single_call(add_cpp, 10000000);