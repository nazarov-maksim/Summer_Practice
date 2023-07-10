module Error
  def birthdayNotToday
    return puts "Ти народився не сьогодні"
  end

  def notCorrectFormat
    puts "Неправильний формат. Має бути 2000-01-20"
  end

  def nameNotCorrect
     puts "Ваше ім'я вказано невірно"
  end

  def idNotCorrect
    puts "Ваш ідентифікатор невірний"
  end

  def alreadyInDatabase
    puts "Ця людина вже є в базі даних"
  end

  def notInDatabase
    puts "Цієї людини немає в базі даних"
  end

  def notFound
    puts "За вашими даними нічого не знайдено"
  end

end