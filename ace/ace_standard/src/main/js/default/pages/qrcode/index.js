export default {
    data: {
        qr_Type: 'rect',
        qr_Size: '300px',
        qr_Col: '#87ceeb',
        col_List: ['#87ceeb','#fa8072','#da70d6','#80ff00ff','#00ff00ff'],
        qr_BCol: '#f0ffff',
        bCol_List: ['#f0ffff','#ffffe0','#d8bfd8']
    },
    settype(e) {
        if (e.checked) {
            this.qr_Type = 'rect'
        } else {
            this.qr_Type = 'circle'
        }
    },
    setvalue(e) {
        this.qr_Value = e.newValue
    },
    setcol(e) {
        this.qr_Col = e.newValue
    },
    setbcol(e) {
        this.qr_BCol = e.newValue
    }
}