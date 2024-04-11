<script lang="ts">
	import Profile from '$src/lib/Profile/Profile.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { profiles, profile: me } = data
	$: ({ profiles, profile: me } = data)
</script>

<BasePage title="Your Organisation">
	{#if profiles && profiles.length != 0}
		<div class="grid grid-rows-1 gap-4 mt-10">
			{#each profiles as profile}
				<Profile {profile} />
			{/each}
		</div>
	{/if}
</BasePage>
