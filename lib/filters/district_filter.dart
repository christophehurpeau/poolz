part of poolz;

@NgFilter(name:'district')
class DistrictFilter {
  call(String value){
    if (value != null && value.isNotEmpty) {
      return int.parse(value.substring(3));
    }
    return '';
  }
}