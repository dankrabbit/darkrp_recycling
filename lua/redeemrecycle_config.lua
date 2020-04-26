RedeemRecycle = {}

RedeemRecycle.recycleCenters = {	-- Entities that take recyclables
	"recycling_center",
}
RedeemRecycle.restrictJobs = true	-- Restrict recycling to RedeemRecycle.jobs
RedeemRecycle.jobs = {		-- Jobs that can recycle if above is true
	"Hobo",
	"City Cleanup Crew",
}
RedeemRecycle.items = {		-- Entities that are recyclable
	"redeemable_can",
	"redeemable_bottle",
	"redeemable_beerbottle",
	"redeemable_lgbottle",
}
RedeemRecycle.itemWorth = {	-- How much are the above entities worth?
	["redeemable_can"] = 3,
	["redeemable_bottle"] = 4,
	["redeemable_beerbottle"] = 5,
	["redeemable_lgbottle"] = 6,
}