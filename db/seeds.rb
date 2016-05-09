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

if ReservationCategory.all.count == 0
  reservation_categories = {
    'GENERAL' => ['No Caste', 'Adiyodi', 'Ambalavasi', 'BRAHMIN', 'GUPTAN', 'KURUPPU', 'Kaimal',
      'MENON', 'NAIR', 'Nambeeshan', 'Nambiar', 'Namboodiri', 'Panicker', 'Pillai', 'Pisharody',
      'Rajput', 'Samantha', 'Thampi', 'Tharakan', 'WARRIER'],
    'SC' => ['Adi Andhra', 'Adi Dravida', 'Adi Karnataka', 'Ajila',
      'Arunthathiyar', 'Ayyanavar', 'Baira', 'Bakuda', 'Balija Naidu',
      'Balija', 'Bandi', 'Baratar', 'Bathada', 'Bathada', 'Bellara',
      'Bharathar', 'Boyan', 'Chakkiliyan', 'Chamar', 'Chandala',
      'Chemman', 'Chemmar', 'Cherama', 'Cheraman', 'Cheramar',
      'Cheruman', 'Domban', 'Gajalu Balija', 'Gavara', 'Gavarai Naidu',
      'Gavari', 'Godagal', 'Godda', 'Gosangi', 'Hasla', 'Holeya',
      'Kadaiyan', 'Kakkalan', 'Kakkan', 'Kalladi', 'Kanakkan', 'Kavara',
      'Kavarai', 'Koodan', 'Koosa', 'Koosa', 'Kootan', 'Kudumban',
      'Kuravar', 'Kuruva', 'Kuruvan', 'Maila', 'Mannan', 'Matha Pulayan',
      'Matha', 'Mavilan', 'Moger', 'Muchi', 'Mundala', 'Nalakeyava',
      'Nalkadaya', 'Nayadi', 'Nerian', 'Padanna', 'Padannan', 'Pallan',
      'Palluvan', 'Pambada', 'Panan', 'Panchama', 'Paraiya', 'Paraiyan',
      'Parathar', 'Paravan', 'Paraya', 'Parayan', 'Parayar', 'Perumannan',
      'Pulaya Vettuvan', 'Pulaya', 'Pulayan', 'Pulayar', 'Pulluvan',
      'Puthirai Vannan', 'Reneyar', 'Samagara', 'Samban', 'Sambava',
      'Sambavan', 'Sambavar', 'Semman', 'Sidhana', 'Sidhanar',
      'Thandan', 'Thotti', 'Valai Chetty', 'Vallon', 'Valluvan',
      'Vannan', 'Vedan', 'Velan', 'Vetan', 'Vettuvan', 'Vettuvan',
      'Wayanad Pulayan', 'Wayanadan Pulayan'],
    'ST' => ['Adiyan', 'Aranda', 'Arandan', 'Cholanaickan', 'Eravallan',
      'Hill Pulaya', 'Irulan', 'Irular', 'Jenu Kurumban', 'Kadar',
      'Kanikar', 'Kanikkaran', 'Karavazhi Pulayan', 'Karimpalan',
      'Kattunayakan', 'Kochuvelan', 'Konda Reddis', 'Kondakapus',
      'Koraga', 'Kota', 'Kudiya', 'Kurichchan', 'Kurichiyan', 'Kurumans',
      'Kurumba Pulayan', 'Kurumban', 'Kurumbar', 'Kurumbas', 'Mahamalasar',
      'Mala Arayan', 'Mala Kuruman', 'Mala Pulayan', 'Mala Vedan',
      'Mala Vettuvan', 'Malai Arayan', 'Malai Pandaran', 'Malai Vedan',
      'Malakkuravan', 'Malapanickar', 'Malasar', 'Malayarayar',
      'Mannan', 'Marati', 'Mavilan', 'Melakudi', 'Moopan', 'Mudugar',
      'Muduvan', 'Mulla Kuruman', 'Mullu Kuruman', 'Muthuvan',
      'Nattu Malayan', 'Paliyar', 'Palleyan', 'Palliya', 'Palliyan',
      'Pamba Pulayan', 'Paniyan', 'Ten Kurumban', 'Thachenadan',
      'Ulladan', 'Ullatan', 'Uraly', 'Vettakuruman', 'Wayanad Kadar'],
    'MUSLIM / MAPPILA' => ['Muslim', 'Mappila'],
    'OBH' => ['24 Manai Telungu Chetty', 'Agasa', 'Alan', 'Allan', 'Allar', 'Ambattan',
      'Andhra Nair', 'Anthuru Nair', 'Arayan', 'Arayavathi', 'Aremahrati', 'Asari', 'Ayar',
      'Ayiravar Nagarathar', 'Bestha', 'Bhandari Or Bhondari', 'Bovies', 'Boya', 'Boyan',
      'Chakkala', 'Chakkamar', 'Chaliya', 'Chaptegara', 'Chavalakkaran', 'Chemman', 'Chemmar',
      'Chettiyar', 'Chetty', 'Chingathan', 'Devadiga', 'Devanga', 'Dheevara', 'Dheevaran Atagara',
      'Dkaikolan', 'Elavaniya', 'Erindavan', 'Eruman', 'Ezhavathi', 'Ezhuthachan', 'Galada Konkani',
      'Ganaka', 'Ganika Including Nagavamsom', 'Ganjam Reddies', 'Gatti', 'Goldsmith', 'Golla',
      'Gowda', 'Gudigara', 'Hegde', 'Hindu Nadar', 'Idiga Including Settibalija', 'Illa Vellalar',
      'Illa', 'Illathar', 'Illathu Pillai', 'Illathu', 'Isanattu Kallar', 'Jangam',
      'Jhetty', 'Jogi', 'Kabera', 'Kadupattan', 'Kaikolan', 'Kalanadi', 'Kalari Panicker',
      'Kalarikurup', 'Kalasi Panicker', 'Kalavanthula', 'Kallan', 'Kallasari', 'Kalthachan',
      'Kamasalasa', 'Kammalas', 'Kani', 'Kanisan', 'Kanisu', 'Kaniyan', 'Kaniyar-Panicker',
      'Kannadiyans', 'Kannan', 'Kannian', 'Karanibhakatula', 'Karikalabhakulu', 'Karuvan',
      'Kavathi', 'Kavudiyaru', 'Kavuthyan', 'Kelasi', 'Kerala Muthali', 'Kharvi', 'Khatri',
      'Kitara', 'Kolaries', 'Kolayan', 'Kollan', 'Konga Malayan', 'Koppala Velamas', 'Korachas',
      'Krishnavaka', 'Kshatriya', 'Kudiyan', 'Kudumbi', 'Kulala', 'Kumbaran', 'Kunduvadiyan',
      'Kuruba', 'Kurumba', 'Kusavan', 'Madiga', 'Madivala', 'Mahratta', 'Malamuthan',
      'Malapanikkar', 'Malavettuvan', 'Malayaar', 'Malayal-Kammala', 'Malayaman', 'Malayan',
      'Maniyani', 'Maratis ', 'Maravan', 'Maravar', 'Maruthuvar', 'Matapathy', 'Mayar',
      'Melakudi', 'Meogers Of Kasargod Taluk', 'Modibanda', 'Mogaveera', 'Mogayan', 'Moili',
      'Moniagar', 'Moopanar', 'Moosari', 'Moovari', 'Mukaya', 'Mukhari', 'Mukkuvan',
      'Naickan Including Tholuva Naicker And Vettikara Naicker', 'Nainar', 'Natahaman',
      'Navithan', 'Nulayan', 'Nusuvan', 'Odan', 'Odda', 'Oudan', 'Padayachi', 'Padmasali',
      'Pallai', 'Pandaram', 'Pandikammala', 'Pandithar', 'Pandithattan', 'Panimalayan',
      'Panniyar Or Pannayar', 'Paravans Of Malabar Area Excluding Kasargod Taluk', 'Parkavakulam',
      'Pathiyan', 'Patnukaran', 'Pattarya', 'Pattusali', 'Perumkollan', 'Peruvannan', 'Pillai',
      'Pranopakari', 'Pulluvan', 'Rajaka', 'Rajapuri', 'Sadhu Chetty Including Telungu Chetty ',
      'Sagara', 'Sakravar', 'Sale', 'Sali', 'Saliyas', 'Samantha', 'Senaikudiayan', 'Senaithalivar',
      'Senapathula', 'Senguthar', 'Senguthar', 'Sivavellala', 'Sourashtra', 'Surithiman', 'Thachan',
      'Thachanadan Muppan', 'Thattan', 'Thogatta', 'Thokolan', 'Thongatta', 'Thottiyan', 'Uppara',
      'Ural Goundan', 'Vada Balija', 'Vadugan', 'Vaduvan', 'Vairagi', 'Vairavi', 'Vaisya Chetty',
      'Vakkaliga', 'Valaiyan', 'Valan', 'Vanibha Chetty', 'Vanika Vaisya', 'Vanika', 'Vaniyan',
      'Vannathan', 'Varnavar', 'Varnnavan', 'Veera Saivas', 'Velaan', 'Vellalar', 'Vellan',
      'Veluthedan', 'Veluthedathu Nair', 'Vilakkathalvan', 'Vilakkithal Nair', 'Vilasan', 'Vilkurup',
       'Viswabrahmins', 'Viswakarmala', 'Viswakarmas', 'Vodde', 'Wayanadan Chetty', 'Wayanadan Kadan',
       'Yadhava', 'Yogeeswar', 'Yogi'],
    'OBX' => ['Convert from Scheduled Caste to christianity', 'SIUC'],
    'ETB' => ['Billuva', 'Ezhavas', 'Illuvan', 'Ishuvan', 'Izhuvan', 'Thiyyas'],
    'BPL in forward class' => ['Adiyodi', 'Ambalavasi', 'BRAHMIN', 'GUPTAN', 'KURUPPU', 'Kaimal',
      'MENON', 'NAIR', 'Nambeeshan', 'Nambiar', 'Namboodiri', 'Panicker', 'Pillai', 'Pisharody',
      'Rajput', 'Samantha', 'Thampi', 'Tharakan', 'WARRIER'],
    'LC' => ['LC other than Anglo-Indians'],
    'O.E.C/SC' => ['Andhra Nair', 'Andhuru Nair', 'Arayan', 'Arayavathi', 'Chakkamar', 'Chemman',
      'Chemmar', 'Converted Scheduled castes', 'Deevaran', 'Dheevara', 'Kubharan', 'Kudumbi',
      'Kulalan', 'Kusavan', 'Madiga', 'Mukkuvan', 'Nulayan', 'Odan', 'Peruvannan', 'Pulluvan',
      'Thachar', 'Valan', 'Varnnavan', 'Vellan'],
    'O.E.C/ST' => ['Alan', 'Allan', 'Allar', 'Chinghathan', 'Erindavan', 'Kalanadi',
      'Konga Malayan', 'Kunduvadiyan', 'Malamuthan', 'Malapanikkar', 'Malavettuvan', 'Malayaar',
      'Malayan', 'Panimalayan', 'Pathiyan', 'Thachanadan Muppan', 'Wayanadu Kadan'],
    'ST-MUSLIM' => ['ETHNIC NATIVES OF LAKSHADWEEP'],
    'CHRISTIAN GENERAL' => ['CSI Christian', 'CSI Jacobite', 'Chaldean', 'Christian Others',
      'Jacobite', 'Knanaya Catholic', 'Knanaya Jacobite', 'Marthomite', 'ORTHODOX', 'PENTACOST',
      'ROMAN CATHOLIC', 'SYRIAN CATHOLIC', 'Syro Malankara Catholic']
  }

  reservation_categories.each do |category, castes|
    @category = ReservationCategory.new(name: category)
    success = @category.save
    if success
      castes.each do |subcaste|
        @subcaste = Caste.new(reservation_category: @category,
          name: subcaste)
        @subcaste.save
      end
    end
  end
end
