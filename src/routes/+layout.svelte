<script lang="ts">
	import '$src/app.css'
	import { invalidateAll } from '$app/navigation'
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import { onMount } from 'svelte'
	import { setSupabaseClient } from '$lib/supabase/supabaseClient.js'
	import type { LayoutData } from './$types'

	export let data: LayoutData
	const { supabase, session } = data

	onMount(() => {
		const {
			data: { subscription }
		} = supabase.auth.onAuthStateChange(() => {
			invalidateAll()
		})

		// save to .ts file to call from everywhere
		setSupabaseClient(supabase)

		return () => {
			subscription.unsubscribe()
		}
	})
</script>

<HeadBar>
	<SvordxCompanyLogo />
	{#if session}
		<AccountDropdown />
	{/if}
</HeadBar>

<slot />
