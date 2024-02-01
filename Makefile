validate-migrations:
	supabase db diff | grep -q "No schema changes found"
