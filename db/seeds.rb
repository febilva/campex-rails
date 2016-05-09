if RegistrationStep.all.count == 0
  registration_steps = [
    { position: 0, name: 'Instructions', icon: 'info', url: '/dashboard/instructions', controller: 'dashboard', action: 'instructions' },
    { position: 1, name: 'Personal', icon: 'child', url: '/dashboard/personal', controller: 'dashboard', action: 'personal' },
    { position: 2, name: 'Address', icon: 'mail outline', url: '/dashboard/address', controller: 'dashboard', action: 'address' },
    { position: 3, name: 'Parent', icon: 'users', url: '/dashboard/parent', controller: 'dashboard', action: 'parent' },
    { position: 4, name: 'Weightages', icon: 'exchange', url: '/dashboard/weightages', controller: 'dashboard', action: 'weightages' },
    { position: 5, name: 'Marks', icon: 'book', url: '/dashboard/marks', controller: 'dashboard', action: 'marks' },
    { position: 6, name: 'Choices', icon: 'list', url: '/dashboard/choices', controller: 'dashboard', action: 'choices' },
    { position: 7, name: 'Submission', icon: 'info', url: '/dashboard/submission', controller: 'dashboard', action: 'submission' },
  ].each{ |s| RegistrationStep.create(position: s[:position], name: s[:name], icon: s[:icon], url: s[:url], controller: s[:controller], action: s[:action])}
end

if Configurator.all.count == 0
  Configurator.create(max_enabled_step: 6)
end
