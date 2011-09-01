var User = Spine.Model.setup('User', 'name', 'email', 'initials');

User.extend(Spine.Model.Ajax);
