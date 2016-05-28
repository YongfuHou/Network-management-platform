local a = require("luci.model.uci").cursor() 

print(a.set("wireless","radio0","txpower","16"))
print(a.save("wireless"))
print(a.commit("wireless"))
print(a.get("network","lan","ipaddr"))
print(a.get("wireless","radio0","txpower"))
