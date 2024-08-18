func ({{.upperStartCamelObject}}) TableName() string {
    return {{.table}}
}

func new{{.upperStartCamelObject}}Model(conn *gorm.DB{{if .withCache}}, c cache.CacheConf{{end}}) *default{{.upperStartCamelObject}}Model {
	err := conn.AutoMigrate(&{{.upperStartCamelObject}}{})
	if err != nil {
       	logx.Errorf("Init Database table %s failed: %v",{{.table}},err)
    }
	return &default{{.upperStartCamelObject}}Model{
		{{if .withCache}}CachedConn: gormc.NewConn(conn, c){{else}}conn:conn{{end}},
		table: {{.table}},
	}
}
