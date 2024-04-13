<script>
	import BasePage from '$lib/UI/BasePage.svelte'
	import Tab from '$lib/UI/Tabs/Tab.svelte'
	import TabBar from '$lib/UI/Tabs/TabBar.svelte'
	import TabContainer from '$lib/UI/Tabs/TabContainer.svelte'
	import { alertStore } from '$src/lib/Alert/alert'

	alertStore.add({
		title: 'MESSAGE 1',
		message: 'Hello This is a test to see the bar',
		type: 'ERROR',
		interval: 5000
	})

	alertStore.add({
		title: 'MESSAGE 2',
		message: 'Hello This is a test to see the bar',
		type: 'INFO',
		interval: 10000
	})

	alertStore.add({
		title: 'MESSAGE 3',
		message: 'Hello This is a test to see the bar',
		type: 'OK',
		interval: 15000
	})

	alertStore.add({
		title: 'MESSAGE 4',
		message: 'Hello This is a test to see the bar',
		type: 'WARNING',
		interval: 20000
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
