<script lang="ts">
	import type { Profile } from '../supabase/schema'

	export let profile: Profile | undefined
	export let profilePicture: string | undefined = ''
	export let className: string = ''
</script>

<div class="grid grid-cols-2 justify-center md:w-1/2 mx-auto gap-5 {className}">
	<img class="aspect-auto w-40 rounded-md" src={profilePicture} alt="" />
	<div class="w-1/2">
		<h1>{profile?.firstname}</h1>
		<h1>{profile?.lastname}</h1>
	</div>
</div>
