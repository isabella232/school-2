unless Refinery::Page.where(link_url: '/about-school').any?
  about_school_page = ::Refinery::Page.create({
    title: 'About school',
    link_url: '/about-school',
    menu_match: '^(/about-school)$',
    deletable: false
  })
  about_school_page.parts.create({
    title: 'Body',
    body: '<p>About school page.</p>',
    position: 0
  })

  unless Refinery::Page.where(link_url: '/about-school/history').any?
    school_history_page = about_school_page.children.create({
      title: "School's history",
      link_url: '/about-school/history',
      menu_match: '^(/about-school/history)$',
      deletable: false
    })
    school_history_page.parts.create({
      title: 'Body',
      body: '<p>School history page.</p>',
      position: 0
    })
  end

  unless Refinery::Page.where(link_url: '/about-school/documents').any?
    school_documents_page = about_school_page.children.create({
      title: 'Documents',
      link_url: '/about-school/documents',
      menu_match: '^(/about-school/documents)$',
      deletable: false
    })
    school_documents_page.parts.create({
      title: 'Body',
      body: '<p>School documents page.</p>',
      position: 0
    })
  end

  unless Refinery::Page.where(link_url: '/about-school/employees').any?
    school_employees_page = about_school_page.children.create({
      title: 'Employees',
      link_url: '/about-school/employees',
      menu_match: '^(/about-school/employees)$',
      deletable: false
    })
    school_employees_page.parts.create({
      title: 'Body',
      body: '<p>School employees page.</p>',
      position: 0
    })
  end

  unless Refinery::Page.where(link_url: '/about-school/sections').any?
    school_sections_page = about_school_page.children.create({
      title: 'Sections',
      link_url: '/about-school/sections',
      menu_match: '^(/about-school/sections)$',
      deletable: false
    })
    school_sections_page.parts.create({
      title: 'Body',
      body: '<p>School sections page.</p>',
      position: 0
    })
  end

  unless Refinery::Page.where(link_url: '/about-school/calendar').any?
    school_calendar_page = about_school_page.children.create({
      title: 'Calendar of competitions',
      link_url: '/about-school/calendar',
      menu_match: '^(/about-school/calendar)$',
      deletable: false
    })
    school_sections_page.parts.create({
      title: 'Body',
      body: '<p>School calendar page.</p>',
      position: 0
    })
  end
end

unless Refinery::Page.where(link_url: '/best-students').any?
  best_students_page = ::Refinery::Page.create({
    title: 'Best students',
    link_url: '/best-students',
    menu_match: '^(/best-students)$',
    deletable: false
  })
  best_students_page.parts.create({
    title: 'Body',
    body: '<p>Best students page.</p>',
    position: 0
  })
end
