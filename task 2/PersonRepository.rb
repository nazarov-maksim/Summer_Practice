require_relative "Person"

class PersonRepository

  def initialize
    @persons = {
      AZ1234567890: {
        first_name: "Leo",
        last_name: "Messi",
        birth_date: "1987-06-24"
      },
      AZ1234567809: {
        first_name: "Andre",
        last_name: "Williams",
        birth_date: "2003-04-20"
      }
    }
  end

  def alreadyInDatabase(person)
    getAll.each do |people|
      if person.id === people[0]
        return Error.alreadyInDatabase
      end
    end
  end

  def notInDatabase(person)
    getAll.each do |people|
      if person.id != people[0]
      return Error.notInDatabase
      end
    end
  end



  def add?(person)
    alreadyInDatabase(person)

    @persons[person.id] = {
      first_name: person.first_name,
      last_name: person.last_name,
      birthday: person.birth_date
    }
  end

  def edit?(person)
    notInDatabase(person)

    @persons[person.id] = {
      first_name: person.first_name,
      last_name: person.last_name,
      birthday: person.birth_date
    }
  end

  def delete(person)
    notInDatabase(person)

    @persons.delete(person.id)
    return person
  end

  def byId(id)
    return @persons[id]
  end

  def byFirstOrLastName(text)
    result = []

    @persons.each do |person|
      if person[:first_name] == text || person[:last_name]
        result << person
      end
    end

    if result != []
      return result
    else
      Error.notFound
    end
  end

  def getAll
    return @persons
  end

  def byDateRange(from, to)
    if start_date.nil?
      start_date = Date.new(1900, 1, 1)
    else
      start_date = Date.parse(start_date)
    end

    if end_date.nil?
      end_date = Date.today - 1
    else
      end_date = Date.parse(end_date)
    end

    @persons.each do |person|
      birthday = Date.parse(person[:birthday])
      return (start_date..end_date).cover?(birthday)
    end
  end

end