#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef unsigned long long ull;
typedef pair<int,int> pii;
typedef pair<ll,ll> pll;
typedef vector<int> vi;
typedef vector<ll> vll;

#define X first
#define Y second
#define mp make_pair
#define all(c) begin(c), end(c)
#define eb emplace_back // tie, ignore, get<i>(a)
#define mem(a,val) memset(a, (val), sizeof a)
#define uni(c) c.resize(distance(c.begin(), unique(all(c))))

#define rep(i,n) for(ll i = 0, _n = (n); i < _n; i++)
#define rep1(i,a,b) for(ll i = a, _b = (b); i <= _b; i++)
#define rep2(i,b,a) for(ll i = b, _a = (a); i >= _a; i--)

#define cout(d) cout << fixed << setprecision(d)
#define err(x) cerr << #x << " = \"" << x << "\"\n"

const ll inf = 1e16, mod = 1e9 + 7;
const double eps = 1e-16;
const int N = 1e5 + 10;

map<string, int> m[12];
int main(int argc, char **argv) {
	freopen(argv[1], "r", stdin);

	ifstream cin2(argv[2]);
	int fileid; cin2 >> fileid;
	
	string temp;
	vector<string> v; int sz(0);
	while(cin >> temp) v.eb(temp), sz++;
	rep1(i,1,10) {
		rep(j,sz-i+1) {
			string temp="";
			rep(k,i) temp += v[j+k] + (k==i-1 ? "":" ");
			m[i][temp]++;
		}
	}
	rep1(i,1,10) {
		string file = "data/len"+to_string(i);
		freopen(file.c_str(), "w", stdout);
		for(auto x: m[i]) cout << fileid << "\t" << x.X << "\t" << x.Y << "\n";
	}
	return 0;
}