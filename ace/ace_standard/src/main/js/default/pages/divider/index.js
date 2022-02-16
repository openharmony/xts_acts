export default {
  data: {
    title: 'World'
  },
  onShow(){
    // 通用属性
    var prop1 =  this.$element("prop1");
    var name1 = prop1.dataSet.name
    var prop2 =  this.$refs.prop2;
    var name2 = prop2.dataSet.name
  }
}