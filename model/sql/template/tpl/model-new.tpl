func ({{.upperStartCamelObject}}) TableName() string {
    return {{.table}}
}

func new{{.upperStartCamelObject}}Model(conn *gorm.DB{{if .withCache}}, c *redis.Redis{{end}}) *default{{.upperStartCamelObject}}Model {

	return &default{{.upperStartCamelObject}}Model{
		{{if .withCache}}CachedConn: gormc.NewNodeConn(conn, c){{else}}conn:conn{{end}},
		table: {{.table}},
	}
}
