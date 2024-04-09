<script>
	import BasePage from '$lib/UI/BasePage.svelte'
	import Tab from '$lib/UI/Tabs/Tab.svelte'
	import TabBar from '$lib/UI/Tabs/TabBar.svelte'
	import TabContainer from '$lib/UI/Tabs/TabContainer.svelte'
	import { alertStore } from '$src/lib/Alert/alert'

	alertStore.add({
		message: 'Hello This is a test to see the bar',
		title: 'MESSAGE',
		type: 'ERROR',
		interval: 2000
	})

	alertStore.add({
		message: 'Hello This is a test to see the bar',
		title: 'MESSAGE',
		type: 'INFO',
		interval: 4000
	})

	alertStore.add({
		message: 'Hello This is a test to see the bar',
		title: 'MESSAGE',
		type: 'OK',
		interval: 6000
	})

	alertStore.add({
		message: 'Hello This is a test to see the bar',
		title: 'MESSAGE',
		type: 'WARNING',
		interval: 8000
	})
</script>

<BasePage title="FINANCE" description="here you can write a littlebit about the page itself">
	<TabContainer>
		<TabBar>
			<Tab>ONE</Tab>
			<Tab>TWO</Tab>
			<Tab>THREE</Tab>
		</TabBar>
	</TabContainer>
</BasePage>
