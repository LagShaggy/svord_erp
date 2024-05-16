<script lang="ts">
	import { onMount } from 'svelte'
	import Input from '../../UI/Primitive/Form/Atoms/Input.svelte'
	import Form from '../../UI/Primitive/Form/Form.svelte'
	import InputEmail from '../../UI/Primitive/Form/InputEmail.svelte'
	import InputText from '../../UI/Primitive/Form/InputText.svelte'
	import SubmitButton from '../../UI/Primitive/Form/SubmitButton.svelte'
	import TextArea from '../../UI/Primitive/Form/TextArea.svelte'
	import { ACTIONS } from '../../routes'
	import type { Account, Country, CurrencyE } from '../../supabase/schema'
	import { getCountries } from '$src/lib/supabase/api/country'
	import { browserSupabase } from '$src/lib/supabase/supabaseClient'
	import CountryFlag from '$src/lib/Icons/Flags/CountryFlag.svelte'

	export let account: Account | null

	let currencies: CurrencyE
	let countries

	onMount(async () => {
		countries = await getCountries(browserSupabase)
	})
</script>

<Form action={ACTIONS.ACCOUNT.CREATE}>
	<h2>Add an Account</h2>

	<InputText name="name" value={account?.name}>Account Name</InputText>
	<InputEmail name="email" value={account?.email}>Email Address</InputEmail>
	<Input type="website" name="website">Website</Input>

	{#await getCountries(browserSupabase)}
		loading countries
	{:then countries}
		<select name="country">
			{#each countries as country}
				<CountryFlag country={country.iso} />
				<option value={country.id}>
					{country.nicename}
				</option>
			{/each}
		</select>
	{/await}

	Description
	<TextArea name={'description'} value={account?.description ?? ''} className="border rounded-md" />

	<SubmitButton>Send</SubmitButton>
</Form>
