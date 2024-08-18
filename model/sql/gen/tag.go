package gen

import (
	"github.com/xbclub/gozctl/model/sql/template"
	"github.com/zeromicro/go-zero/tools/goctl/util"
	"github.com/zeromicro/go-zero/tools/goctl/util/pathx"
)

func genTag(table Table, in string, columnType, isNullAble string, length int64) (string, error) {
	if in == "" {
		return in, nil
	}

	text, err := pathx.LoadTemplate(category, tagTemplateFile, template.Tag)
	if err != nil {
		return "", err
	}

	output, err := util.With("tag").Parse(text).Execute(map[string]any{
		"field":  in,
		"data":   table,
		"type":   columnType,
		"isnull": isNullAble,
		"length": length,
	})
	if err != nil {
		return "", err
	}

	return output.String(), nil
}
