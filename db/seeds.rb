if RegistrationStep.all.count == 0
  registration_steps = [
    { position: 0, name: 'Instructions', icon: 'info', url: '/dashboard/instructions' },
    { position: 1, name: 'Personal', icon: 'child', url: '/dashboard/personal' },
    { position: 2, name: 'Address', icon: 'mail outline', url: '/dashboard/address' },
    { position: 3, name: 'Parent', icon: 'users', url: '/dashboard/parent' },
    { position: 4, name: 'Weightages', icon: 'exchange', url: '/dashboard/weightages' },
    { position: 5, name: 'Marks', icon: 'book', url: '/dashboard/marks' },
    { position: 6, name: 'Choices', icon: 'list', url: '/dashboard/choices' },
    { position: 7, name: 'Submission', icon: 'info', url: '/dashboard/submission' },
  ].each{ |s| RegistrationStep.create(position: s[:position], name: s[:name], icon: s[:icon], url: s[:url])}
end
