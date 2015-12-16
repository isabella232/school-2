unless Refinery::Page.where(slug: 'about-school').any?
  I18n.locale = :ru

  about_school_page = ::Refinery::Page.create(title: I18n.t('about_school'))
  about_school_page.parts.create(
    title: 'Body',
    body: '<p>About school page.</p>',
    position: 0
  )
  about_school_page.update_attributes(slug: 'about-school')

  unless Refinery::Page.where(slug: 'history').any?
    school_history_page = about_school_page.children.create(
      title: I18n.t('school_history')
    )
    school_history_page.parts.create(
      title: 'Body',
      body: '<p>School history page.</p>',
      position: 0
    )
    school_history_page.update_attributes(slug: 'history')
  end

  unless Refinery::Page.where(slug: 'documents').any?
    school_documents_page = about_school_page.children.create(
      title: I18n.t('documents')
    )
    school_documents_page.parts.create(
      title: 'Body',
      body: '<p>School documents page.</p>',
      position: 0
    )
    school_documents_page.update_attributes(slug: 'documents')
  end

  unless Refinery::Page.where(slug: 'sections').any?
    school_sections_page = about_school_page.children.create(
      title: I18n.t('sections')
    )
    school_sections_page.parts.create(
      title: 'Body',
      body: '<p>School sections page.</p>',
      position: 0
    )
    school_sections_page.update_attributes(slug: 'sections')
  end

  unless Refinery::Page.where(link_url: 'calendar').any?
    school_calendar_page = about_school_page.children.create(
      title: I18n.t('calendar_of_competitions')
    )
    school_calendar_page.parts.create(
      title: 'Body',
      body: '<p>School calendar page.</p>',
      position: 0
    )
    school_calendar_page.update_attributes(slug: 'calendar')
  end
end

unless Refinery::Page.where(slug: 'best-students').any?
  best_students_page = ::Refinery::Page.create(
    title: I18n.t('hall_of_fame')
  )
  best_students_page.parts.create(
    title: 'Body',
    body: '<p>Best students page.</p>',
    position: 0
  )
  best_students_page.update_attributes(slug: 'best-students')
end
