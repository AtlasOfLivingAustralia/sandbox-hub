package au.org.ala.sandbox

class CamelCaseTagLib {

  def formatService

  def formatFieldName = { attr, body ->
    def fieldName = attr['value']
    out << formatService.formatFieldName(fieldName)
  }

  def prettyCamel = { attr, body ->
    def value = attr['value]']
    out << formatService.prettyCamel(value)
  }

}